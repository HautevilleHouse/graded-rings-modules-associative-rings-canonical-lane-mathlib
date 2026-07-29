import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRings

structure GradedModuleHom (R : Type u) [Ring R] (G : GradedRing R) (M N : Type v) [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N] (GM : GradedModule R G M) (GN : GradedModule R G N) where
  f : M →ₗ[R] N
  degree : G.grading → G.grading
  preserves_grading : ∀ i : G.grading, f '' (GM.components i : Set M) ⊆ GN.components (degree i)

structure GradedModuleHomEvidence (h : GradedModuleHom R G M N GM GN) where
  preserves_gradingClosed : h.preserves_grading

def GradedModuleHomClosed (h : GradedModuleHom R G M N GM GN) : Prop :=
  h.preserves_grading

theorem graded_module_hom_closed_from_evidence (h : GradedModuleHom R G M N GM GN) (E : GradedModuleHomEvidence h) : GradedModuleHomClosed h := by
  exact E.preserves_gradingClosed

end GradedRingsModulesAssociativeRings
end HautevilleHouse