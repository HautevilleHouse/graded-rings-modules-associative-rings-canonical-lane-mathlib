import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsModulesAssociativeRingsCanonicalLaneLean.GradedRingStructure
import HautevilleHouse.GradedRingsModulesAssociativeRingsCanonicalLaneLean.GradedModuleAction

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure GradedHomologicalAlgebraPackage (R : GradedRingPackage) where
  chainComplex : ℕ → GradedModulePackage R
  differential : ∀ (n : ℕ), chainComplex n → chainComplex (n+1)
  differentialSquareZero : Prop
  homologyGroups : ℕ → Type v

def GradedHomologicalAlgebraClosed (R : GradedRingPackage) (H : GradedHomologicalAlgebraPackage R) : Prop :=
  H.differentialSquareZero

theorem graded_homological_algebra_closed (R : GradedRingPackage) (H : GradedHomologicalAlgebraPackage R) (h : H.differentialSquareZero) : GradedHomologicalAlgebraClosed R H := h

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse
