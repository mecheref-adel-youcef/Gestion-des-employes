// Example starter JavaScript for disabling form submissions if there are invalid fields

function checkPhone(){
    var phones = document.getElementsByClassName("phone");
    for(var i=0;i<phones.length;i++){
        if(isNaN(phones[i].value) || phones[i].value == null || (phones[i].value.length!=10) || (phones[i].value.charAt(0)!='0')){
            phones[i].setCustomValidity("You must choose a number that starts with 0 and contains 10 digits");
        }else {
            phones[i].setCustomValidity("");
        }
    }

}

function checkSalary(){
    var salaires = document.getElementsByClassName('salaire');
    for(var i=0;i<salaires.length;i++) {
        if (isNaN(salaires[i].value) || parseInt(salaires[i].value) == null || parseInt(salaires[i].value) < 50000) {
            salaires[i].setCustomValidity("The salary must be greater than 50000 DA");
        } else {
            salaires[i].setCustomValidity("");
        }
    }

}

function checkDescription(){
    var description = document.getElementById("description");
    var errorDescription = document.getElementById("errorDescription");

    if(description.value == null || description.value.length ==0){
        description.setCustomValidity("Please enter a description ");
        errorDescription.innerHTML ="Please enter a description ";

    } else if (description.value.length > 80){
        description.setCustomValidity("the description exceeds 80 characters");
        errorDescription.innerHTML = "the description exceeds 80 characters";
    } else {
        description.setCustomValidity("");
    }
}

function checkMdescription(){
    var mdescription = document.getElementById("Mdescription");
    var errorMdescription = document.getElementById("errorMdescription");

    if(mdescription.value == null || mdescription.value.length ==0){
        mdescription.setCustomValidity("Please enter a description ");
        errorMdescription.innerHTML ="Please enter a description !!!";

    } else if (mdescription.value.length > 80){
        mdescription.setCustomValidity("the description exceeds 80 characters");
        errorMdescription.innerHTML = "the description exceeds 80 characters";
    } else {
        mdescription.setCustomValidity("");
    }
}






(function() {
    'use strict';
    window.addEventListener('load', function() {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();

                }

                form.classList.add('was-validated');

            }, false);
        });
    }, false);
})();


