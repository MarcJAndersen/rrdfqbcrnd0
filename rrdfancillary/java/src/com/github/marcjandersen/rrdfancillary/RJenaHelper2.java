
package com.github.marcjandersen.rrdfancillary;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.StatusLine;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import com.hp.hpl.jena.datatypes.xsd.XSDDatatype;
import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFactory;
import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Property;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.rdf.model.SimpleSelector;
import com.hp.hpl.jena.rdf.model.Statement;
import com.hp.hpl.jena.rdf.model.StmtIterator;
import com.hp.hpl.jena.shared.PrefixMapping;
import com.hp.hpl.jena.sparql.engine.http.QueryEngineHTTP;

// from apache-jena-2.13.0/src-examples/arq/examples/update/UpdateExecuteOperations.java
// import org.apache.jena.atlas.lib.StrUtils ;
// import org.apache.jena.riot.Lang ;
// import org.apache.jena.riot.RDFDataMgr ;

// import com.hp.hpl.jena.sparql.sse.SSE ;
import com.hp.hpl.jena.update.* ;

public class RJenaHelper2 {

    // patterned after sparql and construct in RJenaHelper2
    // https://jena.apache.org/documentation/query/update.html
    // http://stackoverflow.com/questions/6981467/jena-arq-difference-between-model-graph-and-dataset
    // This is version 3.0.x:
    // https://github.com/apache/jena/blob/master/jena-arq/src-examples/arq/examples/update/UpdateProgrammatic.java

    // note RRDF uses jena 2.12 - DatasetFactory is a 3.0 method
    // use examples from version 2.13 ...
    // /opt/apache-jena-2.13.0/src-examples/arq/examples/update/UpdateExecuteOperations.java
    // same pattern as code for construct and saveRdf
    // ~/packages/rrdf/rrdf/java/src/com/github/egonw/rrdf/RJenaHelper.java
       
  public static void sparqlUpdate(Model model, String updateString) throws Exception {
          UpdateRequest request = UpdateFactory.create() ;
          UpdateFactory.parse(request, updateString);
	  try {
	      UpdateAction.execute(request, model ) ;
	  } finally {
	      //
	  }
  }

}

