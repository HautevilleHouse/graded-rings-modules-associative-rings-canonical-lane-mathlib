import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsModulesAssociativeRingsCanonicalLaneLean.GradedRingStructure
import HautevilleHouse.GradedRingsModulesAssociativeRingsCanonicalLaneLean.GradedModuleAction

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure GradedModuleCategoryPackage (R : GradedRingPackage) where
  objectClass : Type u
  morphismSet : objectClass → objectClass → Type v
  identityMorphism : ∀ (A : objectClass), morphismSet A A
  composition : ∀ (A B C : objectClass), morphismSet A B → morphismSet B C → morphismSet A C
  associativityOfComposition : Prop
  identityLawLeft : Prop
  identityLawRight : Prop
  gradedStructurePreserving : Prop

structure GradedModuleCategoryEvidence {R : GradedRingPackage} (C : GradedModuleCategoryPackage R) where
  associativityOfCompositionClosed : C.associativityOfComposition
  identityLawLeftClosed : C.identityLawLeft
  identityLawRightClosed : C.identityLawRight
  gradedStructurePreservingClosed : C.gradedStructurePreserving

def GradedModuleCategoryClosed {R : GradedRingPackage} (C : GradedModuleCategoryPackage R) : Prop :=
  C.associativityOfComposition ∧ C.identityLawLeft ∧ C.identityLawRight ∧ C.gradedStructurePreserving

theorem graded_module_category_closed_from_evidence {R : GradedRingPackage} (C : GradedModuleCategoryPackage R) (E : GradedModuleCategoryEvidence C) : GradedModuleCategoryClosed C := by
  exact And.intro E.associativityOfCompositionClosed (And.intro E.identityLawLeftClosed (And.intro E.identityLawRightClosed E.gradedStructurePreservingClosed))

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse
