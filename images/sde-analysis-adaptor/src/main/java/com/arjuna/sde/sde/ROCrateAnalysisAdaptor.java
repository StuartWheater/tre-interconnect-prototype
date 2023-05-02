package com.arjuna.sde.lab;

import java.util.UUID;
import java.lang.Error;
import java.lang.Exception;

import jakarta.inject.Inject;
import jakarta.enterprise.context.ApplicationScoped;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.jboss.logging.Logger;

import org.eclipse.microprofile.reactive.messaging.Incoming;
import org.eclipse.microprofile.reactive.messaging.Outgoing;

import edu.kit.datamanager.ro_crate.RoCrate;
import edu.kit.datamanager.ro_crate.writer.RoCrateWriter;
import edu.kit.datamanager.ro_crate.writer.FolderWriter;
import edu.kit.datamanager.ro_crate.entities.data.RootDataEntity;

import com.fasterxml.jackson.databind.JsonNode;

import io.smallrye.reactive.messaging.annotations.Blocking;

@ApplicationScoped
public class ROCrateAnalysisAdaptor
{
    @Inject
    Logger log;

    @Blocking
    @Incoming("outgoing-requests")
    @Outgoing("incoming-responses")
    public RoCrate doAnalysis(Object requestObject)
    {
        try
        {
            ObjectMapper objectMapper = new ObjectMapper();

            log.infof("Class: %s\n", requestObject.getClass().getName());

            return null;
        }
        catch (Error error)
        {
            log.debug("Error while forwarding request RO_Crate", error);
            return null;
        }
        catch (Exception exception)
        {
            log.debug("Exception while forwarding request RO_Crate", exception);
            return null;
        }
    }
}