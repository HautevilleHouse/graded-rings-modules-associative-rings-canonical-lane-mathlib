import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure GradedRing (A : Type u) [AddMonoid A] (R : Type v) [Ring R] where
  decomposition : A → Submodule R R
  directSumDecomposition : IsInternal (decomposition)
  multiplicationRespectsGrading : ∀ (a b : A), (decomposition a) * (decomposition b) ≤ decomposition (a + b)

structure GradedRingEvidence (G : GradedRing A R) where
  directSumDecompositionClosed : G.directSumDecomposition
  multiplicationRespectsGradingClosed : G.multiplicationRespectsGrading

def GradedRingClosed (G : GradedRing A R) : Prop :=
  G.directSumDecomposition ∧ G.multiplicationRespectsGrading

theorem graded_ring_closed_from_evidence (G : GradedRing A R) (E : GradedRingEvidence G) : GradedRingClosed G :=
  And.intro E.directSumDecompositionClosed E.multiplicationRespectsGradingClosed

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse