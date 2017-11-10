/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author GHANSHYAM
 */
import weka.classifiers.functions.SMO;
import weka.classifiers.meta.FilteredClassifier;
import weka.core.Attribute;
import weka.core.DenseInstance;
import weka.core.Instances;
import weka.filters.unsupervised.attribute.StringToWordVector;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.trees.J48;

class Symp_Disease {

    List<String> diseases;
    List<String> symptoms;

    public Symp_Disease(List<String> diseases, List<String> symptoms) {
        this.diseases = diseases;
        this.symptoms = symptoms;
    }
}

@WebServlet(name = "GetDisease", urlPatterns = {"/GetDisease"})
public class HealthPrediction extends HttpServlet {
    static Symp_Disease symp_Disease;
    
    public static void fetchValues() throws Exception{
        symp_Disease = getSymptoms_Diseases();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                fetchValues();
                StringBuilder symptomsBuilder = new StringBuilder();
                symptomsBuilder.append("<symptom>");
                for (String symptom: symp_Disease.symptoms) {
                    symptomsBuilder.append("<symp>" + symptom + "</symp>");
                }
                symptomsBuilder.append("</symptom>");
                out.println(symptomsBuilder.toString());
            } catch (Exception ex) {
                out.println(ex.toString());
            }
        }
    }

    public static String getPredictedDisease(String symptomValue) throws Exception {
        System.out.println(symptomValue);
        return predictHealth(symp_Disease, symptomValue);
    }

    static Symp_Disease getSymptoms_Diseases() throws Exception {
        List<String> symptoms = new ArrayList<>();
        List<String> diseases = new ArrayList<>();
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/healthprediction", "root", "");
            PreparedStatement pStmt = con.prepareStatement("select Symptoms, Disease from healthpredictiondataset");
            ResultSet result = pStmt.executeQuery();
            while (result.next()) {
                if ((-1 == symptoms.indexOf(result.getString("Symptoms")))) {
                    symptoms.add(result.getString("Symptoms"));
                }
                if ((-1 == diseases.indexOf(result.getString("Disease")))) {
                    diseases.add(result.getString("Disease"));
                }
            }

        } catch (Exception e) {
            throw e;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                throw e;
            }
        }
        return new Symp_Disease(diseases, symptoms);
    }

    static String predictHealth(Symp_Disease s_d, String comment) throws Exception {
        try {
            String filePath = "C:\\Users\\GHANSHYAM\\Desktop\\Project\\Mini\\HealthPrediction Dataset.arff";
            BufferedReader br = new BufferedReader(new FileReader(filePath));
            Instances trainingData = new Instances(br);
            trainingData.setClassIndex(trainingData.numAttributes() - 1);
            br.close();

            Attribute attr1 = new Attribute(trainingData.attribute(0).name(), s_d.symptoms);
            Attribute attr2 = new Attribute(trainingData.attribute(1).name(), s_d.diseases);
            ArrayList<Attribute> attributes = new ArrayList<>(trainingData.numAttributes());
            attributes.add(attr1);
            attributes.add(attr2);

            Instances inst = new Instances("Test", attributes, 1);
            inst.setClassIndex(inst.numAttributes() - 1);

            DenseInstance dInst = new DenseInstance(inst.numAttributes());

            dInst.setValue(attr1, s_d.symptoms.indexOf(comment));
            inst.add(dInst);

            StringToWordVector stwv = new StringToWordVector();
            stwv.setInputFormat(trainingData);
            stwv.setIDFTransform(true);
            stwv.setTFTransform(true);
            stwv.setLowerCaseTokens(true);
            stwv.setOutputWordCounts(true);

            FilteredClassifier fc = new FilteredClassifier();
            fc.setFilter(stwv);
            fc.setClassifier(new J48());
            fc.buildClassifier(trainingData);

            double prediction = fc.classifyInstance(inst.instance(0));
            return inst.classAttribute().value((int) prediction);

        } catch (Exception ex) {
            // System.out.print("Error Occurred: " + ex.toString());
            throw ex;
            //JOptionPane.showMessageDialog(this, ex.getMessage(), ex.getClass().toString(), JOptionPane.ERROR_MESSAGE);
        }
    }

}
