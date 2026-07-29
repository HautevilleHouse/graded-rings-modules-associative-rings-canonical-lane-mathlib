import GradedRingsModulesAssociativeRingsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GradedEndgameState where
  object : AdmissibleClass

def gradedProjection : Projection GradedEndgameState :=
  { toFun := fun x => x,
    idempotent := by intro x; rfl
  }

theorem graded_projection_idempotent (x : GradedEndgameState) :
    gradedProjection.toFun (gradedProjection.toFun x) = gradedProjection.toFun x := by
  exact gradedProjection.idempotent x

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse