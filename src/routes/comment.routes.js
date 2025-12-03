const { Router } = require("express");
const CommentController = require("../controllers/CommentController");
const auth = require("../middleware/auth");

const router = Router();

// CREATE (precisa estar logado)
router.post("/", auth, CommentController.create);

// READ (não precisa)
router.get("/", CommentController.list);
router.get("/track/:trackId", CommentController.listByTrack);
router.get("/comunidade/:comunidadeId", CommentController.listByComunidade);

// UPDATE (precisa estar logado)
router.put("/:id", auth, CommentController.update);

// DELETE (precisa estar logado)
router.delete("/:id", auth, CommentController.delete);

module.exports = router;