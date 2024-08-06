import QtQuick
import QtQuick.Controls 2.12 as QQC2
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.20 as Kirigami
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid 2.0

Loader {
    TapHandler {
        property bool wasExpanded: false

        acceptedButtons: Qt.LeftButton
        onPressedChanged: {
            if (pressed)
                wasExpanded = root.expanded;

        }
        onTapped: root.expanded = !wasExpanded
    }

    Kirigami.Icon {
        anchors.fill: parent
        source: Qt.resolvedUrl("assets/g.png")
    }

}
