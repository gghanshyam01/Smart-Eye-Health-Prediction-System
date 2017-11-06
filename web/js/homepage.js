/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


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

function sendFeedback() {

}

function getDiagnoseHistory() {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function ()
    {
        var predictionPlace = document.getElementById("tableData");
        if (this.readyState === 4 && this.status === 200) {
            predictionPlace.innerHTML = this.responseText;
        } else {
        }
    };
    xmlhttp.open("POST", "Predictor?getData=" + "yes", true);
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