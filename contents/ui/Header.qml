import QtQuick
import QtQuick.Controls 2.12 as QQC2
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.20 as Kirigami
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid 2.0

RowLayout {
    Layout.fillWidth: true
    Plasmoid.contextualActions: [
        PlasmaCore.Action {
            text: i18n("Keep Open")
            icon.name: "window-pin"
            priority: Plasmoid.LowPriorityAction
            checkable: true
            checked: plasmoid.configuration.pin
            onTriggered: plasmoid.configuration.pin = checked
        }
    ]

    PlasmaComponents3.Button {
        icon.name: "window-pin"
        text: i18n("Keep Open")
        display: PlasmaComponents3.AbstractButton.IconOnly
        checkable: true
        checked: plasmoid.configuration.pin
        onToggled: plasmoid.configuration.pin = checked
        visible: !plasmoid.configuration.hideKeepOpen
        PlasmaComponents3.ToolTip.text: text
        PlasmaComponents3.ToolTip.delay: Kirigami.Units.toolTipDelay
        PlasmaComponents3.ToolTip.visible: hovered
    }

    Binding {
        target: root
        property: "hideOnWindowDeactivate"
        value: !plasmoid.configuration.pin
        restoreMode: Binding.RestoreBinding
    }

}
