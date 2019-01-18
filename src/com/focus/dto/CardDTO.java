package com.focus.dto;

/**
 * Created by admin on 04-01-2019.
 */
public class CardDTO {
    private String title;
    private String content;
    private String button;
    private String buttnclass;
    CardActionDTO[] cardActionDTO;
    public String getButtnclass() {
        return buttnclass;
    }
    public void setButtnclass(String buttnclass) {
        this.buttnclass = buttnclass;
    }
    public CardActionDTO[] getCardActionDTO() {
        return cardActionDTO;
    }
    public void setCardActionDTO(CardActionDTO[] cardActionDTO) {
        this.cardActionDTO = cardActionDTO;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getButton() {
        return button;
    }

    public void setButton(String button) {
        this.button = button;
    }
}
