import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtWebEngine 2.15
import org.kde.kirigami 2.20 as Kirigami
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.plasmoid 2.0

Item {
    Layout.fillWidth: true
    Layout.fillHeight: true

    WebEngineView {
        id: webView

        anchors.fill: parent
        url: plasmoid.configuration.grammarlyUrl
        profile: grammarlyProfile
        settings.javascriptCanAccessClipboard: true
        onLinkHovered: (hoveredUrl) => {
            if (hoveredUrl.toString() !== "")
                mouseArea.cursorShape = Qt.PointingHandCursor;
            else
                mouseArea.cursorShape = Qt.ArrowCursor;
        }

        WebEngineProfile {
            id: grammarlyProfile

            storageName: "grammarly"
            offTheRecord: false
            httpCacheType: WebEngineProfile.DiskHttpCache
            persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies
        }

    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        acceptedButtons: Qt.BackButton | Qt.ForwardButton
        onPressed: (mouse) => {
            if (mouse.button === Qt.BackButton)
                grammarlyWebview.goBack();
            else if (mouse.button === Qt.ForwardButton)
                grammarlyWebview.goForward();
        }
    }

}
