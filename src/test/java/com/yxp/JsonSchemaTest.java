package com.yxp;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.github.fge.jackson.JsonLoader;
import com.github.fge.jsonschema.core.exceptions.ProcessingException;
import com.github.fge.jsonschema.core.report.ProcessingMessage;
import com.github.fge.jsonschema.core.report.ProcessingReport;
import com.github.fge.jsonschema.main.JsonSchemaFactory;
import com.github.fge.jsonschema.main.JsonSchemaFactoryBuilder;
import org.junit.Test;
import sun.misc.ClassLoaderUtil;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Iterator;

/**
 * @author liuweibo
 * @date 2019/8/25
 */
public class JsonSchemaTest {

    @Test
    public void test1() throws IOException, ProcessingException {
        final ClassLoader classLoader = this.getClass().getClassLoader();
        final URL schemaURL = classLoader.getResource("json-schema/sort-question-schema.json");
        JsonNode schema = JsonLoader.fromURL(schemaURL);

        final URL questionURL = classLoader.getResource("json-schema/sort-question.json");
        JsonNode question = JsonLoader.fromURL(questionURL);
        final ProcessingReport validate = JsonSchemaFactory.byDefault().getJsonSchema(schema).validate(question);
        final Iterator<ProcessingMessage> iterator = validate.iterator();
        while (iterator.hasNext()) {
            final ProcessingMessage next = iterator.next();
            System.out.println(next.getMessage());
        }
        System.out.println(validate.isSuccess());
    }
}
