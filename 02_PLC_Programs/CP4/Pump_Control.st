(*
============================================================
Program Name : Pump_Control
Plant Unit   : CP4 (Demo)
Language     : IEC 61131-3 Structured Text (ST)
Version      : V1.2
Author       : Vipul Pawar
Date         : 28-Jul-2026

Description:
Sample pump control program created for demonstrating
version control in an Industrial OT environment.

NOTE:
This is a demonstration program only.
============================================================
*)

(*--------------- Input Variables ----------------*)

VAR_INPUT
    Start_PB      : BOOL;    (* Start Push Button *)
    Stop_PB       : BOOL;    (* Stop Push Button *)
    Tank_Level    : REAL;    (* Tank Level (%) *)
    Motor_Healthy : BOOL;    (* Motor Health Status *)
    Emergency_Stop: BOOL;    (* Emergency Stop *)
END_VAR

(*--------------- Output Variables ---------------*)

VAR_OUTPUT
    Pump_Run      : BOOL;
END_VAR

(*--------------- Internal Variables -------------*)

VAR
    Start_Request : BOOL;
END_VAR

(*================================================
 Main Logic
================================================*)

(* Emergency Stop *)

IF Emergency_Stop THEN
    Pump_Run := FALSE;
    Start_Request := FALSE;

(* Stop Command *)

ELSIF Stop_PB THEN
    Pump_Run := FALSE;
    Start_Request := FALSE;

(* Start Command *)

ELSIF Start_PB THEN
    Start_Request := TRUE;
END_IF;

(* Pump Start Conditions *)

IF Start_Request
AND Tank_Level >= 100.0
AND Motor_Healthy THEN

    Pump_Run := TRUE;

END_IF;

(* Low Tank Level Protection *)

IF Tank_Level < 30.0 THEN
    Pump_Run := FALSE;
END_IF;
