const TasksContract = artifacts.require('TasksContract');

contract("TasksContract", () => {
    before(async () => {
        this.tasksConrtact = await TasksContract.deployed()
    })

    it('migrate deployed successfully', async () => {
        const address = this.tasksConrtact.address
        assert.notEqual(address, null);
        assert.notEqual(address, undefined);
        assert.notEqual(address, 0x0);
        assert.notEqual(address, "");
    })

    it('get Tasks List', async () => {
        const tasksCounter = await this.tasksConrtact.taskCounter()
        const task = await this.tasksConrtact.tasks(tasksCounter)

        assert.equal(task.id.toNumber(), tasksCounter);
        

    })
})