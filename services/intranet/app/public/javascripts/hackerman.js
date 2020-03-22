let conversation = "";
let currentConversationLine = 0;
let maxConversationLine = 0;
let sayings = "";
let currentSayingsLine = -1;
let maxSayingsLine = -1;
let started = false;
let updateShellText;
let lastSayingTime = null;
let sayingsDelay = 1000 * 1 * 60;
let updated = false;

function hackermanAppear() {
    document.getElementById('hackermanChatBubble').hidden = false;
    document.getElementById('hackermanShell').hidden = false;
    document.getElementById('noobShell').hidden = false;
}

function noMoreHackermanEntries() {
    document.getElementById('hackermanChatBubbleText').innerText = "I don't have anything else to say right now, but come back later!";
}
function updateSayings() {
    if (lastSayingTime === null || Date.now() - lastSayingTime > sayingsDelay) {
        lastSayingTime = Date.now();
        if (currentSayingsLine + 1 <= maxSayingsLine) {
            currentSayingsLine++;;
            document.getElementById('hackermanChatBubbleText').innerText = sayings.split('\n')[currentSayingsLine];
            document.getElementById('hackermanShellText').innerText += `\n${sayings.split('\n')[currentSayingsLine]}`;
            document.getElementById('hackermanShell').scrollTop = document.getElementById('hackermanShell').scrollHeight;
        }
        else {
            updateShellText = noMoreHackermanEntries;
        }
    }
    else {

        noMoreHackermanEntries();
    }
}
function updateConversation() {
    if (currentConversationLine + 1 <= maxConversationLine) {
        currentConversationLine++;;
        document.getElementById('hackermanChatBubbleText').innerText = conversation.split('\n')[currentConversationLine];
        document.getElementById('hackermanShellText').innerText += `\n${conversation.split('\n')[currentConversationLine]}`;
        document.getElementById('hackermanShell').scrollTop = document.getElementById('hackermanShell').scrollHeight;
    }
    else {
        updateShellText = updateSayings;
        updateShellText();
    }
}

function update() {
    if (started === false) {
        started = true;
        hackermanAppear();
    }
    updated = false;
    $.get('hackerman/conversation', function (data, status) {
        if (data.toString() !== conversation) {
            conversation = data;
            currentConversationLine = -1;
            maxConversationLine = data.toString().split(/\r\n|\r|\n/).length - 2;
            updateShellText = updateConversation;
            updateShellText();
        }
    });
    $.get('hackerman/sayings', function (data, status) {
        if (data.toString() !== sayings) {
            sayings = data;
            currentSayingsLine = -1;
            maxSayingsLine = data.toString().split(/\r\n|\r|\n/).length - 2;
        }
    });
}

function startHackermanServiceWorker() {
    update();
    interval = setInterval(update, 5000);
    $(window).keypress(function (e) {
        if (e.which === 32) {
            updateShellText();
        }
    });
    updateShellText = updateConversation;
}
$(document).ready(function () {
    startHackermanServiceWorker();
});