
import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtWebEngine 2.15
import org.kde.kirigami 2.20 as Kirigami
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.plasmoid 2.0

ColumnLayout {
    anchors.fill: parent
    spacing: PlasmaCore.Units.largeSpacing

    Item {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredWidth: Kirigami.Units.gridUnit * 40
        Layout.preferredHeight: Kirigami.Units.gridUnit * 100

        WebEngineView {
            id: grammarlyWebview

            readonly property bool useMinViewWidth: plasmoid.configuration.useMinViewWidth
            anchors.fill: parent
            onUrlChanged: plasmoid.configuration.url = url
            Component.onCompleted: url = plasmoid.configuration.url
            profile: grammarlyProfile
            onLinkHovered: (hoveredUrl) => {
                if (hoveredUrl.toString() !== "")
                    mouseArea.cursorShape = Qt.PointingHandCursor;
                else
                    mouseArea.cursorShape = Qt.ArrowCursor;
            }
            onWidthChanged: {
                if (useMinViewWidth)
                    updateZoomTimer.start();

            }
            onLoadingChanged: (loadingInfo) => {
                if (loadingInfo.status === WebEngineLoadingInfo.LoadStartedStatus)
                    infoButton.dismiss();
                else if (loadingInfo.status === WebEngineLoadingInfo.LoadSucceededStatus && useMinViewWidth)
                    updateZoomTimer.start();
            }
            onContextMenuRequested: (request) => {
                if (request.mediaType === ContextMenuRequest.MediaTypeNone && request.linkUrl.toString() !== "") {
                    linkContextMenu.link = request.linkUrl;
                    linkContextMenu.open(request.position.x, request.position.y);
                    request.accepted = true;
                }
            }
            onNavigationRequested: (request) => {
                var url = request.url;
                if (request.userInitiated)
                    Qt.openUrlExternally(url);
                else
                    infoButton.show(i18nc("An unwanted popup was blocked", "Popup blocked"), "document-close", i18n("Click here to open the following blocked popup:\n%1", url), function() {
                    Qt.openUrlExternally(url);
                    infoButton.dismiss();
                });
            }

            WebEngineProfile {
                id: grammarlyProfile
                httpUserAgent: getUserAgent()
                storageName: "grammarly"
                offTheRecord: false
                httpCacheType: WebEngineProfile.DiskHttpCache
                persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies
            }

            Connections {
                function onMinViewWidthChanged() {
                    updateZoomTimer.start();
                }

                function onUseMinViewWidthChanged() {
                    updateZoomTimer.start();
                }

                function onConstantZoomFactorChanged() {
                    updateZoomTimer.start();
                }

                function onUseConstantZoomChanged() {
                    updateZoomTimer.start();
                }

                target: plasmoid.configuration
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
}
