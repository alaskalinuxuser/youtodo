import QtQuick 2.4
import QtQuick.Layouts 1.1
import Lomiri.Components 1.3
import "scripts/NavActions.js" as NavActions

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'youtodo.alaskalinuxuser'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    PageStack {
        id: mainStack
        Component.onCompleted: NavActions.pushPage ( "List" )
    }

}
