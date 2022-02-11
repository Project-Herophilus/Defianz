  
var express = require('express');
const router = express.Router();
// Constants
//const dataexistingcontroller = require("./querydata/dataexisting.controller");
// Defined Specific Routers - Tied to Constants
router.use('/api/datamatch/person', personcontroller)
module.exports = router;
