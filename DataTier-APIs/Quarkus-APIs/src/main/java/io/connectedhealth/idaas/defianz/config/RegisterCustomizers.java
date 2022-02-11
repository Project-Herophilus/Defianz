package io.connectedhealth.idaas.defianz.config;

import javax.inject.Singleton;
import javax.json.bind.JsonbConfig;

import com.redhat.idaas.datasynthesis.dtos.DataStructureSerializer;

import io.quarkus.jsonb.JsonbConfigCustomizer;

@Singleton
public class RegisterCustomizers implements JsonbConfigCustomizer {

    @Override
    public void customize(JsonbConfig config) {
        config.withSerializers(new DataStructureSerializer());
    }
    
}
