/*------------------------------------------------------------------------
    File        : as_disconnect.p
    Purpose     : AppServer Disconnect procedure. 

    Syntax      :

    Description : 

    Author(s)   : pjudge
    Created     : Fri Jun 04 16:04:42 EDT 2010
    Notes       :
  ----------------------------------------------------------------------*/
routine-level on error undo, throw.

/* ***************************  Main Block  *************************** */
using OpenEdge.Core.InjectABL.IKernel.
using OpenEdge.Lang.ABLSession.
using OpenEdge.Lang.AgentConnection.

using Progress.Lang.Class.
using Progress.Lang.Object.

/* ***************************  Main Block  *************************** */
cast(ABLSession:Instance:SessionProperties:Get(Class:GetClass('OpenEdge.Core.InjectABL.IKernel')),
        IKernel):Clear(AgentConnection:Instance).

delete object AgentConnection:Instance.

/* eof */