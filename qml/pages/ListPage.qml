import QtQuick 2.4
import QtQuick.Layouts 1.1
import Lomiri.Components 1.3
import QtQuick.LocalStorage 2.0
import "../components"
import "../models"
import "../scripts/NavActions.js" as NavActions

Page {
    id: listPage
    anchors.fill: parent


    // ============================== HEADER ===================================
    header: PageHeader {
        id: header
        title: i18n.tr('YouTodo')
        trailingActionBar {
            actions: [
            Action {
                text: i18n.tr("Info")
                iconName: "info"
                onTriggered: NavActions.pushPage("Info")
            },
            Action {
                text: i18n.tr("Clear")
                iconName: "delete"
                onTriggered: taskModel.cleanUp ()
            },
            Action {
                text: i18n.tr("Add task")
                iconName: "add"
                onTriggered: bottomEdge.commit ()
            }
            ]
        }
    }


    // ============================== LIST OF ALL TASKS ========================

    ListView {
        id: taskList
        width: parent.width
        height: parent.height - header.height
        anchors.top: header.bottom
        delegate: TaskDelegate {}
        model: TaskModel {
            id: taskModel
        }
        move: Transition {
            SmoothedAnimation { property: "y"; duration: 300 }
        }
        displaced: Transition {
            SmoothedAnimation { property: "y"; duration: 300 }
        }

        Label {
            text: i18n.tr("Swipe up from the bottom to enter some tasks...")
            textSize: Label.Large
            color: LomiriColors.graphite
            anchors.centerIn: parent
            width: parent.width - units.gu(4)
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideMiddle
            wrapMode: Text.Wrap
            visible: taskModel.count === 0
        }
    }

    // ============================== BOTTOM EDGE ==============================
    BottomEdge {
        id: bottomEdge
        height: parent.height
        contentComponent: Rectangle {
            width: listPage.width
            height: listPage.height
            color: "white"
            AddTaskPage { }
        }
    }
}
