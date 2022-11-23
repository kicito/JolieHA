/*
 * Copyright (C) 2021 Narongrit Unwerawattana <narongrit.kie@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301  USA
 */
package joliex.jolie_ha;

import jolie.runtime.JavaService;
import jolie.runtime.Value;
import jolie.runtime.embedding.RequestResponse;

public class JolieHA extends JavaService {

    @RequestResponse
    public Value start(Value request){
        // TODO implementation, initialize HA with proper arguments 
        return null;
    }

    @RequestResponse
    public Value nextTime(Value request){
        // TODO implementation 
        return null;
    }

    @RequestResponse
    public Value currentStatus(Value request){
        // TODO implementation
        return null;
    }
}