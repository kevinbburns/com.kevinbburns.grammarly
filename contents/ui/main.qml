import QtQuick.Layouts 1.1
import org.kde.kirigami 2.20 as Kirigami
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.plasmoid 2.0

PlasmoidItem {
    id: root

    compactRepresentation: CompactItem {
    }

    fullRepresentation: ColumnLayout {
        Layout.minimumWidth: Kirigami.Units.gridUnit * 28
        Layout.minimumHeight: Kirigami.Units.gridUnit * 39

        Header {
            id: headerRoot

            visible: plasmoid.configuration.hideHeader ? 0 : 1
        }

        WebView {
            id: webviewRoot
        }

    }

}
