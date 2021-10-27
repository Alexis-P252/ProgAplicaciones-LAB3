<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.Chunk"%>


<html lang="en">


<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous" />
    <title>CoronaTickets</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>

<body>
    <%
    if(session.getAttribute("tipo") == null){
        %> <jsp:include page="error_identidad.jsp"/> <%
    }
    else if(session.getAttribute("tipo").equals("Artista")){
        %> <jsp:include page="error_identidad.jsp"/> <%
    }
    else{       
        response.setContentType("application/pdf");
        String fileName = "Comprobante de premio CoronaTickets";
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
        
        String nickname = (String) session.getAttribute("user");
        String s_id = (String) request.getParameter("id");
        int id = Integer.parseInt(s_id);
        DtPremio dtP = sis.GetDtPremio(id);

        SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");
        
 
        //Se crea el documento
        Document documento = new Document();

        try{
        
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            PdfWriter.getInstance(documento, buffer);
            documento.addTitle("Comprobante de Premio - CoronaTickets");
            documento.addCreator("CoronaTickets");

            documento.open();
                
                 documento.add(new Paragraph("CoronaTickets.uy \n",
				FontFactory.getFont("arial",   // fuente
				28,                            // tamaño
				Font.ITALIC,                   // estilo
				BaseColor.BLACK)));             // color

                documento.add(new Paragraph("Comprobante de ganador de premio sorteado en una funcion",
				FontFactory.getFont("arial",   // fuente
				18,                            // tamaño
				Font.ITALIC,                   // estilo
				BaseColor.RED)));             // color
                                

                documento.add(new Paragraph("A continuacion se detalla la informacion del premio \n \n "));
                documento.add(new Paragraph("Espectador: " + nickname));
                documento.add(new Paragraph("Funcion: " + dtP.getFuncion()));
                documento.add(new Paragraph("Espectaculo: " + dtP.getEspectaculo()));
                documento.add(new Paragraph("Descripcion del premio: " + dtP.getDesc_premio()));
                documento.add(new Paragraph("Fecha del sorteo: " + ft2.format(dtP.getFecha_sorteo())));
                documento.add(new Paragraph("\n \n "));
                documento.add(new Paragraph("ATENCION: Este premio solo podra ser reclamado hasta 30 dias despues de la fecha del sorteo, es decir, hasta el " + ft2.format(dtP.getFecha_caduca())));
                
              
                
            documento.close();
            
            DataOutputStream dataOutput = new DataOutputStream(response.getOutputStream());
            byte[] bytes = buffer.toByteArray();
            response.setContentLength(bytes.length);
            for(int i = 0; i < bytes.length; i++)
                dataOutput.writeByte(bytes[i]);

            dataOutput.flush();
            dataOutput.close();
            return;

        }catch(DocumentException e){
            e.printStackTrace();
        }

   
        %>
        
</body>
    
</html>
<% } %>
