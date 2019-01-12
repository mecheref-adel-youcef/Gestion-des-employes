<%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 21/09/2018
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="errorpage.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/test.css">
    <link rel="stylesheet" href="css/animate.css">
    <script type="text/javascript" src="js/validation.js"></script>

    <title>Les employes</title>
</head>
<body class="bg-light">


<nav class="navbar navbar-expand-lg navbar-dark " style="background-color: #00001f;">
    <span class="navbar-brand mb-0 h1 display-1 mx-2">ELIT</span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse ml-3" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link" href="/welcome">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/getEmployees">Enternship Task</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="/SearchEmployee" method="post">
            <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>





<div class="container-fluid  my-3 ">

    <div class="row align-items-center">
        <div class="mx-auto"><button type="button" class=" btn btn-outline-primary rounded-circle myadd" data-toggle="modal" data-target="#add">

            <h1 class="  display-4">+</h1></a>
        </button>
        </div>
    </div>



    <div class="row my-3 ">
        <core:forEach var="employee" items="${employees}">
            <div class="col my-3 ">
                <div class="card mycard " >
                    <img class="card-img-top myimg rounded-circle mt-3 " src="${employee.getPhoto()}" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title text-center mycolor">${employee.getNom()} ${employee.getPrenom()} </h5>
                        <div class="card-text mycolor"><hr class="  mx-5 mt-3 mb-5  " ></div>
                        <div class="row">
                            <button type="button" class="btn btn-outline-primary col mx-1 mt-3" data-toggle="modal" data-target="#profil${employee.getIdemp()}">Profil</button>
                            <button  class="btn btn-outline-warning col mx-1 mt-3" data-toggle="modal" data-target="#modify${employee.getIdemp()}">Modify</button>
                            <button type="button" class="btn btn-outline-danger col mx-1 mt-3" data-toggle="modal" data-target="#delete${employee.getIdemp()}">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
        </core:forEach>

    </div>
</div>


<!-- Modals -->


<core:forEach var="employee" items="${employees}">

    <!-- Modal modify -->
    <div class="modal fade" id="modify${employee.getIdemp()}" tabindex="-1" role="dialog" aria-labelledby="modifyLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modifyLabel">Modify an employee</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <!-- form -->
                    <form class="needs-validation" action="/modifierEmployee?id=${employee.getIdemp()}" method="post" enctype="multipart/form-data" novalidate>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="Mnom">First name</label>
                                <input type="text" class="form-control" id="Mnom" name="Mnom" value="${employee.getNom()}" placeholder="First name" required>
                                <div class="invalid-feedback">First name must not be empty</div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="Mprenom">Last name</label>
                                <input type="text" class="form-control" id="Mprenom" name="Mprenom" value="${employee.getPrenom()}" placeholder="Last name" required>
                                <div class="invalid-feedback">Last name must not be empty</div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label for="Mphone">Phone</label>
                                <input type="phone" class="form-control phone" id="Mphone" value="${employee.getPhone()}" oninput="checkPhone();" name="Mphone" placeholder="Phone " required>
                                <div class="invalid-feedback">You must choose a number that starts with 0 and contains 10 digits</div>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="Mgendre">Gendre</label>
                                <select class="custom-select" id="Mgendre" name="Mgendre" required>
                                    <option value="${employee.getGendre()}" selected="selected">${employee.getGendre()}</option>
                                    <option value="Man">Man</option>
                                    <option value="Woman">Woman</option>
                                </select>
                                <div class="invalid-feedback">Please choose a gendre.</div>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="Mwilaya">Wilaya</label>
                                <select class="custom-select" id="Mwilaya" name="Mwilaya" required>
                                    <option value="${employee.getWilaya()}" selected="selected">${employee.getWilaya()}</option>
                                    <option value="ADRAR">1- ADRAR</option>
                                    <option value="CHLEF">2- CHLEF</option>
                                    <option value="LAGHOUAT">3- LAGHOUAT</option>
                                    <option value="OUM EL BOUAGHI">4- OUM EL BOUAGHI</option>
                                    <option value="BATNA">5- BATNA</option>
                                    <option value="BEJAIA">6- BEJAIA</option>
                                    <option value="BISKRA">7- BISKRA</option>
                                    <option value="BECHAR">8- BECHAR</option>
                                    <option value="BLIDA">9- BLIDA</option>
                                    <option value="BOUIRA">10- BOUIRA</option>
                                    <option value="TAMENRASSET">11- TAMENRASSET</option>
                                    <option value="TEBESSA">12- TEBESSA</option>
                                    <option value="TELEMCEN">13- TELEEMCEN</option>
                                    <option value="TIARET">14- TIARET</option>
                                    <option value="TIZI OUZOU">15- TIZI OUZOU</option>
                                    <option value="ALGER">16- ALGER</option>
                                    <option value="DJELFA">17- DJELFA</option>
                                    <option value="JIJEL">18- JIJEL</option>
                                    <option value="SETIF">19- SETIF</option>
                                    <option value="SAIDA">20- SAIDA</option>
                                    <option value="SKIKDA">21- SKIKDA</option>
                                    <option value="SIDI BEL ABBES">22- SIDI BEL ABBES</option>
                                    <option value="ANNABA">23- ANNABA</option>
                                    <option value="GUELMA">24- GUELMA</option>
                                    <option value="CONSTANTINE">25- CONSTANTINE</option>
                                    <option value="MEDEA">26- MEDEA</option>
                                    <option value="MOSTAGANEM">27- MOSTAGANEM</option>
                                    <option value="MSILA">28- MSILA</option>
                                    <option value="MASCARA">29- MASCARA</option>
                                    <option value="OUARGLA">30- OUARGLA</option>
                                    <option value="ORAN">31- ORAN</option>
                                    <option value="EL BAYADH">32- EL BAYADH</option>
                                    <option value="ILLIZI">33- ILLIZI</option>
                                    <option value="BORDJ BOU ARRERIDJ">34- BORDJ BOU ARRERIDJ</option>
                                    <option value="BOUMERDES">35- BOUMERDES</option>
                                    <option value="EL TARAF">36- EL TARAF</option>
                                    <option value="TINDOUF">37- TINDOUF</option>
                                    <option value="TISSEMSILT">38- TISSEMSILT</option>
                                    <option value="EL OUED">39- EL OUED</option>
                                    <option value="KHENCHLA">40- KHENCHLA</option>
                                    <option value="SOUK AHRAS">41- SOUK AHRAS</option>
                                    <option value="TIPAZA">42- TIPAZA</option>
                                    <option value="MILA">43- MILA</option>
                                    <option value="AIN DEFLA">44- AIN DEFLA</option>
                                    <option value="NAAMA">45- NAAMA</option>
                                    <option value="AIN TEMOUCHENT">46- AIN TEMOUCHENT</option>
                                    <option value="GHARDAIA">47- GHARDAIA</option>
                                    <option value="RELIZENE">48- RELIZANE</option>
                                </select>
                                <div class="invalid-feedback">Please choose a wilaya.</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Msalaire">Salary</label>
                            <div class="input-group">
                                <input type="text" class="form-control salaire" id="Msalaire" oninput="checkSalary();"  value="${employee.getSalaire()}"  name="Msalaire" aria-label="Dinnar amount " required>
                                <div class="input-group-append">
                                    <span class="input-group-text">DA</span>
                                </div>
                                <div class="invalid-feedback">The salary must be greater than 50000 DA</div>
                            </div>
                        </div>
                        <div class="form-group my-4">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="Mphoto" name="Mphoto" required>
                                <label class="custom-file-label" for="photo">Choose picture...</label>
                                <div class="invalid-feedback">Please choose a picture.</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Mdescription">Description</label>
                            <textarea class="form-control " id="Mdescription" oninput="checkMdescription();" rows="3" name="Mdescription" required>${employee.getDescription()}</textarea>
                            <div class="invalid-feedback"><p id="errorMdescription">Please enter a description<p></div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary" type="submit">Submit </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>


                    </form>
                    <!-- end form  -->
                </div>


            </div>
        </div>
    </div>


    <!-- Modal delete -->
    <div class="modal fade" id="delete${employee.getIdemp()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    This will delete the employee definitely
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="/deleteEmployee?id=${employee.getIdemp()}" role="button" class="btn btn-primary">Confirm</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal profil-->
    <div class="modal fade" id="profil${employee.getIdemp()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">

                <div class="modal-body text-center mt-3 mb-5" >
                    <img class="card-img-top myimg  rounded-circle mt-3 " src="${employee.getPhoto()}" alt="Card image cap">
                    <h5  class="h5 mt-3 mb-4 text-muted">${employee.getNom()} ${employee.getPrenom()}</h5>
                    <hr style="margin-right: 8rem; margin-left: 8rem; " class="mb-5">
                    <h6><strong>Working date : </strong>${employee.getDatedemploi()}</h6>

                    <h6><strong>Phone : </strong>${employee.getPhone()}</h6>

                    <h6><strong>Salary : </strong>${employee.getSalaire()} DA</h6>

                    <h6><strong>Wilaya : </strong>${employee.getWilaya()}</h6>

                    <h6><strong>Gendre : </strong>${employee.getGendre()}</h6>

                    <h6><strong>Description : </strong>${employee.getDescription()}</h6>



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</core:forEach>




<!-- Modal add -->
<div class="modal  fade" id="add" tabindex="-1" role="dialog" aria-labelledby="addLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content ">
            <div class="modal-header">
                <h5 class="modal-title" id="addLabel">Add a new employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <!-- form -->
                <form class="needs-validation" action="/Formulaire" method="post" enctype="multipart/form-data" novalidate>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="nom">First name</label>
                            <input type="text" class="form-control" id="nom" name="nom" placeholder="First name" required>
                            <div class="invalid-feedback">First name must not be empty</div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="prenom">Last name</label>
                            <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Last name" required>
                            <div class="invalid-feedback">Last name must not be empty</div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <label for="phone">Phone</label>
                            <input type="phone" class="form-control phone" id="phone"  oninput="checkPhone();" name="phone" placeholder="Phone " required>
                            <div class="invalid-feedback">You must choose a number that starts with 0 and contains 10 digits</div>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="Mgendre">Gendre</label>
                            <select class="custom-select" id="gendre" name="gendre" required>
                                <option value="">Choose...</option>
                                <option value="Man">Man</option>
                                <option value="Woman">Woman</option>
                            </select>
                            <div class="invalid-feedback">Please choose a gendre.</div>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="wilaya">Wilaya</label>
                            <select class="custom-select" id="wilaya" name="wilaya" required>
                                <option value="">Choose...</option>
                                <option value="ADRAR">1- ADRAR</option>
                                <option value="CHLEF">2- CHLEF</option>
                                <option value="LAGHOUAT">3- LAGHOUAT</option>
                                <option value="OUM EL BOUAGHI">4- OUM EL BOUAGHI</option>
                                <option value="BATNA">5- BATNA</option>
                                <option value="BEJAIA">6- BEJAIA</option>
                                <option value="BISKRA">7- BISKRA</option>
                                <option value="BECHAR">8- BECHAR</option>
                                <option value="BLIDA">9- BLIDA</option>
                                <option value="BOUIRA">10- BOUIRA</option>
                                <option value="TAMENRASSET">11- TAMENRASSET</option>
                                <option value="TEBESSA">12- TEBESSA</option>
                                <option value="TELEMCEN">13- TELEEMCEN</option>
                                <option value="TIARET">14- TIARET</option>
                                <option value="TIZI OUZOU">15- TIZI OUZOU</option>
                                <option value="ALGER">16- ALGER</option>
                                <option value="DJELFA">17- DJELFA</option>
                                <option value="JIJEL">18- JIJEL</option>
                                <option value="SETIF">19- SETIF</option>
                                <option value="SAIDA">20- SAIDA</option>
                                <option value="SKIKDA">21- SKIKDA</option>
                                <option value="SIDI BEL ABBES">22- SIDI BEL ABBES</option>
                                <option value="ANNABA">23- ANNABA</option>
                                <option value="GUELMA">24- GUELMA</option>
                                <option value="CONSTANTINE">25- CONSTANTINE</option>
                                <option value="MEDEA">26- MEDEA</option>
                                <option value="MOSTAGANEM">27- MOSTAGANEM</option>
                                <option value="MSILA">28- MSILA</option>
                                <option value="MASCARA">29- MASCARA</option>
                                <option value="OUARGLA">30- OUARGLA</option>
                                <option value="ORAN">31- ORAN</option>
                                <option value="EL BAYADH">32- EL BAYADH</option>
                                <option value="ILLIZI">33- ILLIZI</option>
                                <option value="BORDJ BOU ARRERIDJ">34- BORDJ BOU ARRERIDJ</option>
                                <option value="BOUMERDES">35- BOUMERDES</option>
                                <option value="EL TARAF">36- EL TARAF</option>
                                <option value="TINDOUF">37- TINDOUF</option>
                                <option value="TISSEMSILT">38- TISSEMSILT</option>
                                <option value="EL OUED">39- EL OUED</option>
                                <option value="KHENCHLA">40- KHENCHLA</option>
                                <option value="SOUK AHRAS">41- SOUK AHRAS</option>
                                <option value="TIPAZA">42- TIPAZA</option>
                                <option value="MILA">43- MILA</option>
                                <option value="AIN DEFLA">44- AIN DEFLA</option>
                                <option value="NAAMA">45- NAAMA</option>
                                <option value="AIN TEMOUCHENT">46- AIN TEMOUCHENT</option>
                                <option value="GHARDAIA">47- GHARDAIA</option>
                                <option value="RELIZENE">48- RELIZANE</option>
                            </select>
                            <div class="invalid-feedback">Please choose a wilaya.</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="salaire">Salary</label>
                        <div class="input-group">
                            <input type="text" class="form-control salaire" id="salaire" placeholder="Enter the amount" oninput="checkSalary();" name="salaire" aria-label="Dinnar amount " required>
                            <div class="input-group-append">
                                <span class="input-group-text">DA</span>
                            </div>
                            <div class="invalid-feedback">The salary must be greater than 50000 DA</div>
                        </div>
                    </div>
                    <div class="form-group my-4">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="photo" name="photo" required>
                            <label class="custom-file-label" for="photo">Choose picture...</label>
                            <div class="invalid-feedback">Please choose a picture.</div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control " id="description" rows="3" oninput="checkDescription();" name="description" placeholder="Software Engineer ..." required></textarea>
                        <div class="invalid-feedback"><p id="errorDescription" >Please enter a description<p></div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit">Submit </button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>


                </form>
                <!-- end form  -->
            </div>


        </div>
    </div>
</div>

<div class="container mt-5">
    <hr>
    <div class="row">
        <div class="col-md-12 text-center">
            <h6 class="my-4">Copyright &copy; Mecheref Adel Youcef 2018</h6>
        </div>
    </div>
</div>






<script src="js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>