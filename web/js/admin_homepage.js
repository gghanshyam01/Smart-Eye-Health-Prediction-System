/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function ()
    {
        if (this.readyState === 4 && this.status === 200) {

            document.getElementById("tblUserBody").innerHTML = this.responseText;
            $('#tblUser').DataTable();
        } else {
            //document.getElementById("val").innerHTML = "LOADING...";
        }
    };
    xmlhttp.open("GET", "GetData?allusers=" + "yes", true);
    xmlhttp.send();
});

function viewUsers() {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function ()
    {
        if (this.readyState === 4 && this.status === 200) {

            document.getElementById("tblUserBody").innerHTML = this.responseText;
            $('#tblUser').DataTable();
        } else {
            //document.getElementById("val").innerHTML = "LOADING...";
        }
    };
    xmlhttp.open("GET", "GetData?allusers=" + "yes", true);
    xmlhttp.send();
}

function getPrediction() {
    var xmlhttp = new XMLHttpRequest();
    var symptom = document.getElementById('symp1').value;
    xmlhttp.onreadystatechange = function ()
    {
        var predictionPlace = document.getElementById("prediction");
        if (this.readyState === 4 && this.status === 200) {
            predictionPlace.innerHTML = "<h6>" + this.responseText + "</h6>";
        } else {
            predictionPlace.innerHTML = "Predicting...";
        }
    };
    xmlhttp.open("POST", "Predictor?symptom1=" + symptom, true);
    xmlhttp.send();
}

function viewFeedback() {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function ()
    {
        if (this.readyState === 4 && this.status === 200) {

            document.getElementById("tblFeedbackBody").innerHTML = this.responseText;
            $('#tblFeedback').DataTable();
        } else {
            //document.getElementById("val").innerHTML = "LOADING...";
        }
    };
    xmlhttp.open("GET", "GetData?feedback=" + "yes", true);
    xmlhttp.send();
}

$(document).ready(function () {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function ()
    {
        if (this.readyState === 4 && this.status === 200) {
            var symptomData = this.responseXML;
            symptoms = symptomData.getElementsByTagName('symp');
            var symptom = "<option></option>";
            for (i = 0; i < symptoms.length; i++) {
                val = symptoms[i].childNodes[0].nodeValue;
                symptom += "<option value='" + val + "'>" + val + "</option>";
            }
            document.getElementById("symp1").innerHTML = symptom;
        } else {
            //document.getElementById("val").innerHTML = "LOADING...";
        }
    };
    xmlhttp.open("GET", "GetDisease", true);
    xmlhttp.send();
});
