package dao;

import com.sun.corba.se.pept.transport.Connection;

import connection.SingleConnection;

public class DaoCalculaDataFinal {

	private Connection connection;
	
	public DaoCalculaDataFinal(){
		connection = (Connection) SingleConnection.getConnection();
	}
}
