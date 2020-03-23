let conversation = "";
let currentConversationLine = 0;
let maxConversationLine = 0;
let started = false;
let lastSayingTime = null;
let sayingsDelay = 1000 * 1 * 60;

function hackermanAppear() {
    document.getElementById('hackermanChatBubble').hidden = false;
    document.getElementById('hackermanShell').hidden = false;
    document.getElementById('noobShell').hidden = false;
}

function noMoreHackermanEntries() {
    document.getElementById('hackermanChatBubbleText').innerText = "I don't have anything else to say right now, but come back later!";
}

function updateHackermanShell() {
    if (currentConversationLine + 1 <= maxConversationLine) {
        currentConversationLine++;;
        document.getElementById('hackermanChatBubbleText').innerText = conversation.split('\n')[currentConversationLine];
        document.getElementById('hackermanShellText').innerText += `\n${conversation.split('\n')[currentConversationLine]}`;
        document.getElementById('hackermanShell').scrollTop = document.getElementById('hackermanShell').scrollHeight;
    }
    else {
        noMoreHackermanEntries();
    }
}

function updateConversationText() {
    $.get('hackerman/conversation', function (data, status) {
        if (data.toString() !== conversation) {
            conversation = data;
            currentConversationLine = -1;
            maxConversationLine = data.toString().split(/\r\n|\r|\n/).length - 2;
            updateHackermanShell();
        }
    });
}

function startHackermanServiceWorker() {
    hackermanAppear();
    updateConversationText();
    setInterval(updateConversationText, 5000);
    $(window).keypress(function (e) {
        if (e.which === 32) {
            updateHackermanShell();
        }
    });
}

$(document).ready(function () {
    startHackermanServiceWorker();
});