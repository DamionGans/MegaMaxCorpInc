function htmlbodyisempty() {
    return document.body.innerHTML == "";
}

function deletehtmlbody() {
    document.body.innerHTML = document.body.innerHTML.substr(Math.floor(Math.random() * (7)) + 7);
    if (htmlbodyisempty() == false) {

        setTimeout(deletehtmlbody, 20);
    }
    else {
        console.log("no");
        hackerman();
    }
}

function hackermanenter() {
    var redirectWindow = window.open('hackerman.html', '_blank');
    redirectWindow.location;
}

function hackerman() {
    if (htmlbodyisempty() == false) {
        deletehtmlbody();
    }
    else {
        document.body.innerHTML = "<video width='100%' height='90%' id='hackerman' onclick='hackermanenter()'><source src='videos/hackerman.mp4'><source src='videos/hackerman.ogg'></video><p id='reporthackerman'></p>";
        document.getElementById("hackerman").play();
        document.getElementById("reporthackerman").innerHTML = "<a onclick='hackermanenter()' href='#'>So you think you're a skilled IT guy ha?! Let me show you!</a>";
    }

}