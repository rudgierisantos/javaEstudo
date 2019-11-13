package servlet;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;

import beans.BeanCursoJsp;
import sun.rmi.server.Dispatcher;
import dao.DaoUsuario;

@WebServlet("/pages/fileUpload")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DaoUsuario daoUsuario = new DaoUsuario();
  
    public FileUpload() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String acao = request.getParameter("acao");
			
			if(acao.equalsIgnoreCase("carregar")){
			
				RequestDispatcher view = request.getRequestDispatcher("upload.jsp");
				request.setAttribute("listaUserImagem", daoUsuario.listar());
			    view.forward(request, response);
			
			}else if(acao.equalsIgnoreCase("download")){
				String iduser = request.getParameter("iduser");
				BeanCursoJsp imagem = daoUsuario.buscaImagem(iduser);
				if(imagem!= null){
					
					response.setHeader("Content-Disposition", "attachment;filename=arquivo." + imagem.getContentType());
					
					/*Pega somente imagem pura*/
					String imagemPura = imagem.getFotoBase64().split(",")[1];
					
					/* Coverte base 64 em bytes */
					byte [] imageBytes = new Base64().decodeBase64(imagemPura);
					
					/* Coloca os bytes em um objeto de entrada para processar */
					InputStream is = new ByteArrayInputStream(imageBytes);
					
					/*Inicio - Escrever dados da resposta*/
					
					int read = 0;
					byte[] bytes = new byte[1024];
					OutputStream os = response.getOutputStream();
					
					while ((read = is.read(bytes)) != -1){
						os.write(bytes, 0, read);		
					}
					os.flush();os.close();
					
					/*Fim - Escrever dados da resposta*/
				}
				
			}
			
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		//Usar variável fileUpload para salvar no banco de dados
		String fileUpload = request.getParameter("fileUpload");
		//Nesse momento faz o insert no banco de dados.
		
		daoUsuario.gravarImagem(fileUpload);
		
		response.getWriter().write("Upload Realizado com Sucesso");
		
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Erro Fatal ao realizar o upload");
		}
	}

}
