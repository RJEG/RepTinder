console.log("hello webtechproblem");

holeUser();

holeInserate();

    function holeUser(){

        let userID = localStorage.getItem('userID');
        let token = localStorage.getItem('token');

        let formData = new FormData();
        formData.append('userID', userID);
        
    
        fetch("https://491875-3.web.fhgr.ch//php/holeUser.php",
            {
                body: formData,
                method: "post",
                headers: {
    
                    'Authorization': 'Basic ' + btoa(userID + ':' + token),
    
                }
            })
    
            .then((res) => {
    
                // falls die Sitzung nicht abgelaufen ist, verarbeite die JSON antwort
                if (res.status >= 200 && res.status < 300) {
    
                    return res.json();
    
                } else {
    
                    alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                    window.location = "/login.html"
    
                }
    
            })
            .then((data) => {
    
                // mache etwas
                // console.log(data);
                // console.log(data[0].Name);
                document.querySelector("#username").innerHTML = data[0].Name;

    
            })
    
}

function holeInserate(){
    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);
    

    fetch("https://491875-3.web.fhgr.ch//php/holeInserate.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // falls die Sitzung nicht abgelaufen ist, verarbeite die JSON antwort
            if (res.status >= 200 && res.status < 300) {

                return res.json();

            } else {

                alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "/login.html"

            }

        })
        .then((data) => {

            // mache etwas
            console.log(data);

            InserateAnzeigen(data);
            // console.log(data[0].Name);
            // document.querySelector("#username").innerHTML = data[0].Name;


        })
}

function InserateAnzeigen(data) {

    data.forEach(inserat => {


        if (parseInt(inserat.status)) {

            inserat.status = '🟢';

        } else {

            inserat.status = "🔴"

        }


        let inseratContainer = document.createElement("div");
        inseratContainer.innerHTML =

            '<div class="inserat">' +
            '<h2>' + inserat.status + ' ' + inserat.titel + '</h2>' +
            '<img class="inserat-image" src="' + inserat.bild + '">' +
            '<p>' + inserat.beschreibung + '</p>' +
            '📍 <a target="_blank" href="https://www.google.com/maps/search/?api=1&query=' + inserat.adresse + '">' + inserat.adresse + '</a> <br>' +
            '👉 <a target="_blank" href="mailto:' + inserat.email + '">' + inserat.email + '</a>' +
            '<p> <b> <span id="inserat-' + inserat.ID + '">  </span> <b> </p>'
            + '</div>';

        document.getElementById("liste-inserat").appendChild(inseratContainer);

        holeHashtagsVonInserat(inserat.ID);

    });
}

function holeHashtagsVonInserat(id) {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('inseratID', id);

    fetch("https://491875-3.web.fhgr.ch//php/holeHashtagsVonInserat.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // error handling if session is expired
            if (res.status >= 200 && res.status < 300) {

                return res.json();

            } else {

                alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "/login.html"

            }

        })
        .then((data) => {

            if (data.length > 0) {

                data.forEach(element => {

                    // füge die Hashtags ins Dokument ein 
                    // (hook: ID, welche in der Funktion InserateAnzeigen dynamisch vergeben wird)
                    document.getElementById("inserat-" + id).innerHTML += '#' + element.hashtag + ' ';

                });

            }

        })

}

function logout(){
    localStorage.clear();
    window.location = "/login.html";
}



