pragma solidity ^0.5.0;

contract wiik {
    function nativeLoops() public returns (uint _r) {
        for(uint i = 0; i < 10; i++) {
            _r++;
        }
    }
    
    function lpos() public returns (uint _r) {
        assembly {
            let i := 0
            loop:
            i := add(i, 1)
            _r := add(_r, 1)
            jumpi(loop, lt(i, 10))
        }
    }
    
    function undom() public returns(uint _r) {
        assembly {
            0  // i
            10 // max
            
            loop:
            // i := add(i, 1)
            dup2 
            1
            add
            swap2
            pop
            // _r := add(_r, 1)
            dup3
            1
            add
            swap3
            pop
            0  // i
            10 // max
            lt
            // jumpi
            loop
            jumpi
            
            0  // i
            10 // max
            
        }
    }
    
}
