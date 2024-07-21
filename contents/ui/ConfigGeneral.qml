import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 2.15
import org.kde.kcmutils as KCM
import org.kde.kirigami 2.20 as Kirigami

KCM.SimpleKCM {
    property alias cfg_constantZoomFactor: constantZoomFactor.value

        Kirigami.FormLayout {

            RowLayout {

                QQC2.Label {
                    text:"Content Zoom :  "
                    font.pixelSize: 18
                }

                QQC2.SpinBox {
                    id: constantZoomFactor

                    editable: true
                    enabled: true
                    textFromValue: function(value) {
                    return value + "%";
                }
                valueFromText: function(text) {
                return text.split(" ")[0].split("%")[0];
            }
            from: 25
            to: 500

            validator: RegularExpressionValidator {
                regularExpression: /[0-9]?[0-9]{2}[ ]?%/
            }

        }
    }
}
