module Andromeda.Hardware.Device where

import Andromeda.Hardware.HDL

import qualified Data.Map as M

-- Defined somewhere else.
type Measurement = ()
toMeasurement :: Parameter -> Measurement
toMeasurement _ = ()

data DeviceComponent = Sensor Measurement Guid
                     | Controller Guid
  deriving Eq

newtype Device = DeviceImpl (M.Map ComponentIndex DeviceComponent)
  deriving Eq
  
blankDevice :: Device
blankDevice = DeviceImpl M.empty

addSensor :: ComponentIndex -> Parameter -> ComponentDef -> Device -> Device
addSensor idx p c (DeviceImpl d) = DeviceImpl $ M.insert idx (Sensor (toMeasurement p) (componentGuid c)) d

addController :: ComponentIndex -> ComponentDef -> Device -> Device
addController idx c (DeviceImpl d) = DeviceImpl $ M.insert idx (Controller (componentGuid c)) d

getComponent :: ComponentIndex -> Device -> Maybe DeviceComponent
getComponent idx (DeviceImpl d) = undefined

updateComponent :: ComponentIndex -> DeviceComponent -> Device -> Maybe Device
updateComponent idx c d = undefined

setMeasurement :: ComponentIndex -> Measurement -> Device -> Maybe Device
setMeasurement = undefined 

readMeasurement :: ComponentIndex -> Device -> Maybe Measurement
readMeasurement = undefined

    
