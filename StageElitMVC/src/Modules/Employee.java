package Modules;

public class Employee {
    private String idemp;
    private String nom,prenom,datedemploi,gendre;
    private String phone,salaire;
    private String wilaya,photo,description;

    public Employee(String nom, String prenom, String gendre, String phone, String salaire, String wilaya, String photo, String description) {
        this.nom = nom;
        this.prenom = prenom;
        this.gendre = gendre;
        this.phone = phone;
        this.salaire = salaire;
        this.wilaya = wilaya;
        this.photo = photo;
        this.description = description;
    }

    public String getGendre() {
        return gendre;
    }

    public void setGendre(String gendre) {
        this.gendre = gendre;
    }

    public String getDatedemploi() {
        return datedemploi;
    }

    public void setDatedemploi(String datedemploi) {
        this.datedemploi = datedemploi;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSalaire() {
        return salaire;
    }

    public void setSalaire(String salaire) {
        this.salaire = salaire;
    }

    public String getWilaya() {
        return wilaya;
    }

    public void setWilaya(String wilaya) {
        this.wilaya = wilaya;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIdemp() {
        return idemp;
    }

    public void setIdemp(String idemp) {
        this.idemp = idemp;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public boolean testSalaire(){
        return (Integer.parseInt(this.getSalaire())>=50000)?true:false;
    }

    public boolean testPhone(){
        return (this.getPhone().length()==10 && this.getPhone().charAt(0)=='0')? true:false;
    }

    public Employee() {
    }

    public Employee(String nom, String prenom,  String phone, String salaire, String wilaya, String photo, String description) {
    
        this.nom = nom;
        this.prenom = prenom;
        this.phone = phone;
        this.salaire = salaire;
        this.wilaya = wilaya;
        this.photo = photo;
        this.description = description;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "idemp=" + idemp +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                '}';
    }
}
