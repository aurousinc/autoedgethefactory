/** ------------------------------------------------------------------------
    File        : WidgetHandle
    Purpose     : Primitive class for widget-handle variables    
    Syntax      : 
    Description : 
    @author pjudge
    Created     : Tue Apr 19 09:47:07 EDT 2011
    Notes       : * Initial requirement for collections; having a class for the
                    primitive value means that we don't have to distinguish between
                    primitives and types, which makes the code more readable.
  ----------------------------------------------------------------------*/
routine-level on error undo, throw.

using OpenEdge.Core.Util.IExternalizable.
using OpenEdge.Core.Util.IObjectInput.
using OpenEdge.Core.Util.IObjectOutput.
using OpenEdge.Lang.WidgetHandle.
using OpenEdge.Lang.IABLPrimitive.

using Progress.Lang.Class.
using Progress.Lang.Object.
 
class OpenEdge.Lang.WidgetHandle  
    implements IExternalizable, IABLPrimitive: 
    
    define static public property Type as class Class no-undo
        get():
            if not valid-object(WidgetHandle:Type) then
                WidgetHandle:Type = Class:GetClass('OpenEdge.Lang.WidgetHandle').
            
            return WidgetHandle:Type.
        end.
        private set.
        
    define public property Value as handle no-undo get. private set.
    
    constructor public WidgetHandle():
        this-object(?).
    end constructor.

    constructor public WidgetHandle(input phValue as handle):
        super().
        
        this-object:Value = phValue.
    end constructor.
    
    method override public logical Equals(input p0 as Object):
        if type-of(p0, WidgetHandle) then
            return (this-object:Value eq cast(p0, WidgetHandle):Value).
        else
            return super:Equals(p0).    
    end method.    
            
/** IExternalizable **/
	method public void ReadObject(input poStream as IObjectInput ):
        this-object:Value = poStream:ReadHandle().		
	end method.
	
	method public void WriteObject(input poStream as IObjectOutput):
	    poStream:WriteHandle(this-object:Value).
	end method.

end class.