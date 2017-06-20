/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.6
import ClusterDemo 1.0

Item {
    id: consumtionMeter
    property real consumptionValue: 2.0 + ValueSource.rpm / 444.45

    property real minValueAngle: 378
    property real maxValueAngle: 291
    property real minimumValue: 0
    property real maximumValue: 20

    anchors.right: parent.right
    anchors.top: parent.top
    anchors.topMargin: 243
    anchors.rightMargin: 276

    GaugeFiller {
        id: consumptionFiller
        value: consumtionMeter.consumptionValue
        anchors.fill: parent
        numVertices: 32
        radius: 155
        fillWidth: 20
        color: "#EF2973"
        opacity: 0.3
        minAngle: consumtionMeter.minValueAngle
        maxAngle: consumtionMeter.maxValueAngle
        minValue: consumtionMeter.minimumValue
        maxValue: consumtionMeter.maximumValue
        Behavior on value {
            enabled: !ValueSource.runningInDesigner && !ValueSource.automaticDemoMode && startupAnimationsFinished
            PropertyAnimation { duration: 250 }
        }
    }

    Item {
        width: 311
        height: 7
        rotation: consumptionFiller.angle - 72
        anchors.centerIn: parent

        Image {
            width: 95
            height: 3
            //opacity: 0.75
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            source: "image://etc/SpeedometerNeedle.png"
        }
    }
}
