import org.kde.kirigami 2.20 as Kirigami
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.plasmoid 2.0

PlasmoidItem {
    id: root
    preferredRepresentation: compactRepreseantation
    compactRepresentation: CompactItem {}
    fullRepresentation: FullItem {}
    Plasmoid.icon: Qt.resolvedUrl("./../images/g.png")
}
