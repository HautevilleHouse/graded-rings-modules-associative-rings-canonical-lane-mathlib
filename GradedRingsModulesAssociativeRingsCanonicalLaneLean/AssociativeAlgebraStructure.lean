import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRings

structure GradedAlgebra (R : Type u) [CommRing R] (A : Type v) [Ring A] [Algebra R A] (G : GradedRing A) where
  algebraMapImage : ∀ r : R, algebraMap R A r ∈ G.components (0 : G.grading)

structure GradedAlgebraEvidence (GA : GradedAlgebra R A G) where
  algebraMapImageClosed : GA.algebraMapImage

def GradedAlgebraClosed (GA : GradedAlgebra R A G) : Prop :=
  GA.algebraMapImage

theorem graded_algebra_closed_from_evidence (GA : GradedAlgebra R A G) (E : GradedAlgebraEvidence GA) : GradedAlgebraClosed GA := by
  exact E.algebraMapImageClosed

end GradedRingsModulesAssociativeRings
end HautevilleHouse