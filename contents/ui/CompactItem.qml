import QtQuick 2.15
import QtQuick.Layouts 2.15
import org.kde.kirigami 2.20 as Kirigami
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.plasmoid 2.0

Kirigami.Icon {
    property PlasmoidItem plasmoidItem
    readonly property bool inPanel: [PlasmaCore.Types.TopEdge,
        PlasmaCore.Types.RightEdge, PlasmaCore.Types.BottomEdge,
        PlasmaCore.Types.LeftEdge].includes(Plasmoid.location)

        Layout.minimumWidth: {
            switch (Plasmoid.formFactor) {
            case PlasmaCore.Types.Vertical:
            return 0;
            case PlasmaCore.Types.Horizontal:
            return height;
            default:
            return Kirigami.Units.gridUnit * 3;
        }
    }
    Layout.minimumHeight: {
        switch (Plasmoid.formFactor) {
        case PlasmaCore.Types.Vertical:
        return width;
        case PlasmaCore.Types.Horizontal:
        return 0;
        default:
        return Kirigami.Units.gridUnit * 3;
    }
}

anchors.centerIn: parent
source: Qt.resolvedUrl("./../images/g.png")
active: mouseArea.containsMouse
activeFocusOnTab: true
MouseArea {
    id: mouseArea
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton
    hoverEnabled: true
    onClicked: root.expanded = !root.expanded;
}
}


