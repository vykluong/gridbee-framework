// This file is part of the GridBee Web Computing Framework
// <http://webcomputing.iit.bme.hu>
// Copyright 2011 Budapest University of Technology and Economics,
// Public Administration's Centre of Information Technology (BME IK)
//
// GridBee is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// GridBee is distributed in the hope that it will be useful
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with GridBee. If not, see <http://www.gnu.org/licenses/>.

package gridbee.js;

/**
 * ...
 * @author MG
 */

// http://www.whatwg.org/specs/web-apps/current-work/multipage/comms.html#event-definitions-1
interface MessageEvent implements Event
{
	public var data : Dynamic;
	public var origin : String;
	public var lastEventId : String;
	//public var source : Dynamic;
	//public var ports : Dynamic;
}

// http://www.whatwg.org/specs/web-workers/current-work/#runtime-script-errors
interface ErrorEvent implements Event
{
	public var message : String;
	public var filename : String;
	public var lineno : Int;
}

// http://www.whatwg.org/specs/web-workers/current-work/
extern class Worker implements EventTarget
{
	public function addEventListener(type : String, listener : Dynamic, useCapture : Bool = false) : Void;
	public function removeEventListener(type : String, listener : Dynamic, useCapture : Bool = false) : Void;
	public function dispatchEvent(event : Event) : Bool;	
	
	public dynamic function onmessage(evt : MessageEvent) : Void;
	public dynamic function onerror(evt : ErrorEvent) : Void;
	
	public function new(filename : String) : Void;
	
	// TODO: messagePort
	public function postMessage(message : Dynamic) : Void;
	public function terminate() : Void;
	
	private static function __init__() : Void
	{
		try
		{
			untyped gridbee.js["Worker"] = untyped __js__("Worker");
		} catch (e : Dynamic) {
			untyped gridbee.js["Worker"] = null;
		}
	}

}