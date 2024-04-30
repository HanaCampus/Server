package com.hana.app.common.type;

import java.util.Arrays;
import java.util.Optional;

public enum UType {
    Active("Active"),
    Deleted("Deleted"),
    Suspended("Suspended");

    private String value;

    UType(String uType){
        this.value = uType;
    }

    public String getValue(){
        return value;
    }

    public static Optional<UType> getUType(String uType){
        return Arrays.stream(UType.values())
                .filter(utype -> utype.getValue().equals(uType))
                .findAny();

    }
}
