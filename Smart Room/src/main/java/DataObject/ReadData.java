package DataObject;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Iterator;

public class ReadData {
    public ReadData() throws SQLException {
        String username = "postgres";
        String password = "BOOKmarks12";
        String URL = "jdbc:postgresql://localhost/smartroom";
        Connection connection = null;
        try {
            //file location
            FileInputStream file =
                    new FileInputStream("C:\\Data\\smartroom_exampledata (3).xlsx");
            Workbook workbook = new XSSFWorkbook(file);
            DataFormatter dataFormatter = new DataFormatter();
            Iterator<Sheet> sheetIterator = workbook.sheetIterator();
            connection = DriverManager.getConnection(URL, username, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
            System.out.println(" ");
            while (sheetIterator.hasNext()){
                Sheet sh = sheetIterator.next();
                System.out.println(sh.getSheetName());
                System.out.println("-------------------");
                for (Row row : sh) {
                    for (Cell cell : row) {
                        String cellValue = dataFormatter.formatCellValue(cell);
                        //if(cell.getCellType() == CellType.STRING){

                        //}
                        System.out.print(cellValue + "\t\t");
                    }
                    System.out.println(" ");
                }
                System.out.println(" ");

            }

            workbook.close();
        }
        catch (FileNotFoundException e){
            e.printStackTrace();
        }
        catch (IOException e){
            e.printStackTrace();
        }
        catch (SQLException e){
            System.out.println(e.getMessage());
            connection.close();
        }

    }
}
