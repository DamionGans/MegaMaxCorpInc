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
    document.getElementById('hackermanConversation').innerText = "I don't have anything else to say right now, but come back later!";
    document.getElementById('spaceOrClickText').style.visibility = "hidden";
}

function updateHackermanShell() {
    if (currentConversationLine + 1 <= maxConversationLine) {
        currentConversationLine++;;
        document.getElementById('hackermanConversation').innerText = conversation.split('\n')[currentConversationLine];
        document.getElementById('hackermanShellText').innerText += `\n${conversation.split('\n')[currentConversationLine]}`;
        document.getElementById('hackermanShell').scrollTop = document.getElementById('hackermanShell').scrollHeight;
        document.getElementById('spaceOrClickText').style.visibility = "vissible";
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
            maxConversationLine = data.toString().split(/\r\n|\r|\n/).length - 1;
            updateHackermanShell();
        }
    });
}

function noobShellEntry() {
    $("#noobShellInput").submit(function (e) {
        e.preventDefault();

        $.post('hackerman/noobShellEntry',
            { entry: document.getElementById('noobshellInputEntry').value },
            function (data, status) {
                document.getElementById('noobShellText').innerText += `\n${document.getElementById('noobshellInputEntry').value}`;
                document.getElementById('noobshellInputEntry').value = null;
                if (data.toString() === 'invalid') {
                    document.getElementById('noobShellText').innerText += `\n> ${data}`;
                }
                else {
                    document.getElementById('noobShellText').innerText += `\n> Succefully completed challenge ${data}, loading next challenge...`;
                }
            }
        )
    });
}

function startHackermanServiceWorker() {
    hackermanAppear();
    updateConversationText();
    noobShellEntry();
    setInterval(updateConversationText, 5000);
    $(window).keypress(function (e) {
        if (e.which === 32 && document.activeElement !== document.getElementById('noobshellInputEntry')) {
            updateHackermanShell();
        }
    });
    $("#hackermanChatBubble").click(function () {
        updateHackermanShell();
    });
}

$(document).ready(function () {
    startHackermanServiceWorker();
});