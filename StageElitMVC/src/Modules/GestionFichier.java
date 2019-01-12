package Modules;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.*;

public class GestionFichier {

    private static final long serialVersionUID = 1L;

    public static final int TAILLE_TAMPON = 10240;
    public static final String CHEMIN_FICHIERS = "C:\\Users\\JOSEPH\\IdeaProjects\\StageElitMVC\\web\\photo_stage\\"; // A changer

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public static int getTailleTampon() {
        return TAILLE_TAMPON;
    }

    public static String getCheminFichiers() {
        return CHEMIN_FICHIERS;
    }

    public String uploadFichier(HttpServletRequest request,String nom) throws IOException, ServletException {
        /** pour les envoi des fichier */
        // On récupère le champ du fichier
        Part part = request.getPart(nom);

        // On vérifie qu'on a bien reçu un fichier
        String nomFichier = getNomFichier(part);

        // Si on a bien un fichier
        if (nomFichier != null && !nomFichier.isEmpty()) {
            String nomChamp = part.getName();
            // Corrige un bug du fonctionnement d'Internet Explorer
            nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
                    .substring(nomFichier.lastIndexOf('\\') + 1);

            // On écrit définitivement le fichier sur le disque
            ecrireFichier(part, nomFichier, getCheminFichiers());
        }

        return nomFichier;
        //*********************************************************************

    }

    public void ecrireFichier(Part part, String nomFichier, String chemin ) throws IOException {
        BufferedInputStream entree = null;
        BufferedOutputStream sortie = null;
        try {
            entree = new BufferedInputStream(part.getInputStream(), TAILLE_TAMPON);
            sortie = new BufferedOutputStream(new FileOutputStream(new File(chemin + nomFichier)), TAILLE_TAMPON);

            byte[] tampon = new byte[TAILLE_TAMPON];
            int longueur;
            while ((longueur = entree.read(tampon)) > 0) {
                sortie.write(tampon, 0, longueur);
            }
        } finally {
            try {
                sortie.close();
            } catch (IOException ignore) {
            }
            try {
                entree.close();
            } catch (IOException ignore) {
            }
        }
    }

    public static String getNomFichier( Part part ) {
        for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( contentDisposition.trim().startsWith( "filename" ) ) {
                return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
            }
        }
        return null;
    }
}
