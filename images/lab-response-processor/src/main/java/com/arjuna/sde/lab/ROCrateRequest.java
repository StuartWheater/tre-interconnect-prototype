package com.arjuna.sde.lab;

import java.lang.Error;
import java.lang.Exception;
import java.util.UUID;
import java.util.List;
import java.util.ArrayList;

import java.io.InputStream;

import jakarta.inject.Inject;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.core.MediaType;
import jakarta.enterprise.context.ApplicationScoped;

import org.jboss.logging.Logger;

import org.eclipse.microprofile.reactive.messaging.Incoming;
import io.vertx.core.json.JsonObject;

import edu.kit.datamanager.ro_crate.RoCrate;
import edu.kit.datamanager.ro_crate.writer.RoCrateWriter;
import edu.kit.datamanager.ro_crate.writer.FolderWriter;
import edu.kit.datamanager.ro_crate.entities.data.RootDataEntity;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;

import io.minio.MinioClient;
import io.minio.GetObjectArgs;

import io.smallrye.reactive.messaging.annotations.Blocking;

@Path("/request")
public class ROCrateRequest
{
    @Inject
    Logger log;

    @Inject
    public MinioClient minioClient;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getRequest(@QueryParam("requestid") String requestId)
    {
        log.info("############ Lab - ROCrateRequest.getRequest ############");

        StringBuilder results = new StringBuilder();
        try
        {
            InputStream inputStream = minioClient.getObject(GetObjectArgs.builder().bucket("requests").object(requestId).build());

            for (int ch; (ch = inputStream.read()) != -1;)
                results.append((char) ch);
        }
        catch (Error error)
        {
            log.error("Error while obtaining request RO_Crate", error);
        }
        catch (Exception exception)
        {
            log.error("Exception while obtaining request RO_Crate", exception);
        }

        return results.toString();
    }
}