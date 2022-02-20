// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract TasksContract {

    uint public taskCounter = 0;

    constructor() {
        createTask("Tarea de Ejemplo", "descripcion de Ejemplo");
    }

    struct Task {
        uint id;
        string title;
        string description;
        bool done;
        uint createAt;
    }
    mapping(uint => Task) public tasks;

    function createTask(string memory _title, string memory _description) public{
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, _title, _description, false, block.timestamp);
    }
    

    function toggleDone(uint _id) public{
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
    }


}