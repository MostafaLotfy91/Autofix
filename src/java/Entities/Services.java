
package Entities;

public class Services {
    private int servicesId;
    private String servicesName;
    private int servicesPrice;
    private String Image ;
    private String htmlPage;

    public int getServicesId() {
        return servicesId;
    }

    public void setServicesId(int servicesId) {
        this.servicesId = servicesId;
    }

    public String getServicesName() {
        return servicesName;
    }

    public void setServicesName(String servicesName) {
        this.servicesName = servicesName;
    }

    public int getServicesPrice() {
        return servicesPrice;
    }

    public void setServicesPrice(int servicesPrice) {
        this.servicesPrice = servicesPrice;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getHtmlPage() {
        return htmlPage;
    }

    public void setHtmlPage(String htmlPage) {
        this.htmlPage = htmlPage;
    }

    @Override
    public String toString() {
        return "Services{" + "servicesId=" + servicesId + ", servicesName=" + servicesName + ", servicesPrice=" + servicesPrice + ", Image=" + Image + ", htmlPage=" + htmlPage + '}';
    }
    
}
