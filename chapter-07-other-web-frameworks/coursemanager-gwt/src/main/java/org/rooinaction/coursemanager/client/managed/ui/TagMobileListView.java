package org.rooinaction.coursemanager.client.managed.ui;

import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.i18n.client.NumberFormat;
import com.google.gwt.safehtml.shared.SafeHtml;
import com.google.gwt.safehtml.shared.SafeHtmlBuilder;
import com.google.gwt.safehtml.shared.SafeHtmlUtils;
import com.google.gwt.text.client.DateTimeFormatRenderer;
import com.google.gwt.text.shared.AbstractRenderer;
import com.google.gwt.text.shared.AbstractSafeHtmlRenderer;
import com.google.gwt.text.shared.Renderer;
import java.util.HashSet;
import java.util.Set;
import org.rooinaction.coursemanager.client.scaffold.ScaffoldMobileApp;
import org.rooinaction.coursemanager.client.scaffold.ui.MobileProxyListView;
import org.rooinaction.coursemanager.web.gwt.proxies.CourseProxy;
import org.rooinaction.coursemanager.web.gwt.proxies.TagProxy;

public class TagMobileListView extends TagMobileListView_Roo_Gwt {

    private static org.rooinaction.coursemanager.client.managed.ui.TagMobileListView instance;

    public TagMobileListView() {
        super("New Tag", new CellRenderer());
        init();
    }

    public static org.rooinaction.coursemanager.client.managed.ui.TagMobileListView instance() {
        if (instance == null) {
            instance = new TagMobileListView();
        }
        return instance;
    }

    public String[] getPaths() {
        return paths.toArray(new String[paths.size()]);
    }

    private static class CellRenderer extends AbstractSafeHtmlRenderer<TagProxy> {

        private final String dateStyle = ScaffoldMobileApp.getMobileListResources().cellListStyle().dateProp();

        private final String secondaryStyle = ScaffoldMobileApp.getMobileListResources().cellListStyle().secondaryProp();

        private final Renderer<String> primaryRenderer = new AbstractRenderer<String>() {

            public String render(java.lang.String obj) {
                return obj == null ? "" : String.valueOf(obj);
            }
        };

        private final Renderer<String> secondaryRenderer = new AbstractRenderer<String>() {

            public String render(java.lang.String obj) {
                return obj == null ? "" : String.valueOf(obj);
            }
        };

        @Override
        public SafeHtml render(TagProxy value) {
            if (value == null) {
                return SafeHtmlUtils.EMPTY_SAFE_HTML;
            }
            SafeHtmlBuilder sb = new SafeHtmlBuilder();
            if (value.getTag() != null) {
                sb.appendEscaped(primaryRenderer.render(value.getTag()));
            }
            sb.appendHtmlConstant("<div style=\"position:relative;\">");
            sb.appendHtmlConstant("<div class=\"" + secondaryStyle + "\">");
            if (value.getDescription() != null) {
                sb.appendEscaped(secondaryRenderer.render(value.getDescription()));
            }
            sb.appendHtmlConstant("</div>");
            sb.appendHtmlConstant("<div class=\"" + dateStyle + "\">");
            sb.appendHtmlConstant("</div>");
            sb.appendHtmlConstant("</div>");
            return sb.toSafeHtml();
        }
    }
}
