PROGRAM Tank_Level
VAR
    TankLevel : REAL;          // Current tank level in %
    HighLevelSetpoint : REAL := 80.0;   // High level threshold (%)
    LowLevelSetpoint  : REAL := 20.0;   // Low level threshold (%)
    PumpRunning : BOOL := FALSE;        // Pump status
    HighLevelAlarm : BOOL := FALSE;     // High level alarm flag
    LowLevelAlarm  : BOOL := FALSE;     // Low level alarm flag
END_VAR

// Main logic
IF TankLevel >= HighLevelSetpoint THEN
    HighLevelAlarm := TRUE;         // Raise high level alarm
    PumpRunning := FALSE;           // Stop pump to avoid overflow
ELSE
    HighLevelAlarm := FALSE;
END_IF;

IF TankLevel <= LowLevelSetpoint THEN
    LowLevelAlarm := TRUE;          // Raise low level alarm
    PumpRunning := TRUE;            // Start pump to fill tank
ELSE
    LowLevelAlarm := FALSE;
END_IF;
