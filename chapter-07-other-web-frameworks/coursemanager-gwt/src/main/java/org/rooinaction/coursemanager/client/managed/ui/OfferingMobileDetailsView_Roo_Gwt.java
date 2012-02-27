// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.

package org.rooinaction.coursemanager.client.managed.ui;

import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.Element;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.HasClickHandlers;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.i18n.client.NumberFormat;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.uibinder.client.UiHandler;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.HTMLPanel;
import com.google.gwt.user.client.ui.Widget;
import java.util.Set;
import org.rooinaction.coursemanager.client.scaffold.place.ProxyDetailsView;
import org.rooinaction.coursemanager.web.gwt.proxies.CourseProxy;
import org.rooinaction.coursemanager.web.gwt.proxies.InstructorProxy;
import org.rooinaction.coursemanager.web.gwt.proxies.OfferingProxy;
import org.rooinaction.coursemanager.web.gwt.proxies.RegistrationProxy;

public abstract class OfferingMobileDetailsView_Roo_Gwt extends Composite implements ProxyDetailsView<OfferingProxy> {

    @UiField
    Element id;

    @UiField
    Element runDate;

    @UiField
    Element course;

    @UiField
    Element registrations;

    @UiField
    Element instructor;

    @UiField
    Element version;

    OfferingProxy proxy;

    public void setValue(OfferingProxy proxy) {
        this.proxy = proxy;
        id.setInnerText(proxy.getId() == null ? "" : String.valueOf(proxy.getId()));
        runDate.setInnerText(proxy.getRunDate() == null ? "" : DateTimeFormat.getFormat(DateTimeFormat.PredefinedFormat.DATE_SHORT).format(proxy.getRunDate()));
        course.setInnerText(proxy.getCourse() == null ? "" : org.rooinaction.coursemanager.client.managed.ui.CourseProxyRenderer.instance().render(proxy.getCourse()));
        registrations.setInnerText(proxy.getRegistrations() == null ? "" : org.rooinaction.coursemanager.client.scaffold.place.CollectionRenderer.of(org.rooinaction.coursemanager.client.managed.ui.RegistrationProxyRenderer.instance()).render(proxy.getRegistrations()));
        instructor.setInnerText(proxy.getInstructor() == null ? "" : org.rooinaction.coursemanager.client.managed.ui.InstructorProxyRenderer.instance().render(proxy.getInstructor()));
        version.setInnerText(proxy.getVersion() == null ? "" : String.valueOf(proxy.getVersion()));
    }
}