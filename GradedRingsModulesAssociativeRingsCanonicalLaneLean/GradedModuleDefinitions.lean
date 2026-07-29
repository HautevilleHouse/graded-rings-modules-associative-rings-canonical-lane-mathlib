import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure GradedModule {A : Type u} [AddMonoid A] {R : Type v} [Ring R] (G : GradedRing A R) (M : Type w) [AddCommMonoid M] [Module R M] where
  decomposition : A → Submodule R M
  directSumDecomposition : IsInternal (decomposition)
  actionRespectsGrading : ∀ (a : A) (r : G.decomposition a) (m : M), r • m ∈ decomposition a

structure GradedModuleEvidence {A : Type u} [AddMonoid A] {R : Type v} [Ring R] {G : GradedRing A R} {M : Type w} [AddCommMonoid M] [Module R M] (GM : GradedModule G M) where
  directSumDecompositionClosed : GM.directSumDecomposition
  actionRespectsGradingClosed : GM.actionRespectsGrading

def GradedModuleClosed {A : Type u} [AddMonoid A] {R : Type v} [Ring R] {G : GradedRing A R} {M : Type w} [AddCommMonoid M] [Module R M] (GM : GradedModule G M) : Prop :=
  GM.directSumDecomposition ∧ GM.actionRespectsGrading

theorem graded_module_closed_from_evidence {A : Type u} [AddMonoid A] {R : Type v} [Ring R] {G : GradedRing A R} {M : Type w} [AddCommMonoid M] [Module R M] (GM : GradedModule G M) (E : GradedModuleEvidence GM) : GradedModuleClosed GM :=
  And.intro E.directSumDecompositionClosed E.actionRespectsGradingClosed

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse