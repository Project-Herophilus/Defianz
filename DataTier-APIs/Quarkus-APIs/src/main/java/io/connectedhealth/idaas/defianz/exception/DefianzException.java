package io.connectedhealth.idaas.defianz.exception;

import java.io.Serializable;

public class DefianzException extends Exception implements Serializable {
    private static final long serialVersionUID = 1L;

    public DefianzException() {
        super();
    }

    public DefianzException(String msg) {
        super(msg);
    }

    public DefianzException(String msg, Exception e) {
        super(msg, e);
    }
}